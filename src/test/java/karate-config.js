function fn() {
  var env = karate.env; 
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
  }
  if (env == 'dev') {
    config.urlBase='https://petstore.swagger.io/v2'
    config.dummyJsonUrl = 'https://dummyjson.com'
    config.jsonPlaceholderUrl = 'https://jsonplaceholder.typicode.com'
  } else if (env == 'e2e') {
  }
  return config;
}