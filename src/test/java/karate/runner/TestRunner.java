package karate.runner;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import karate.util.ReportGenerator;

class TestRunner {
    @Test
    void testAll() {

        Results results = Runner.path("classpath:resources/features").outputCucumberJson(true).parallel(1);

        ReportGenerator.generateReport("target/karate-reports");

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}