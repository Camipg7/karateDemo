package karate.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ReportGenerator {

    public static void generateReport(String karateOutputPath) {

        Collection<File> jsonFiles = FileUtils.listFiles(
                new File(karateOutputPath),
                new String[]{"json"},
                true
        );

        List<String> jsonPaths = new ArrayList<>();

        for (File file : jsonFiles) {
            jsonPaths.add(file.getAbsolutePath());
        }

        Configuration config = new Configuration(
                new File("target"),
                "Karate API Automation"
        );

        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}