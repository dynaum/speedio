/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */

systems({
  speedio: {
    depends:   [],
    image:     {"docker": "ruby:2.1"},
    workdir:   "/azk/#{manifest.dir}",
    shell:     "/bin/bash",
    command:   "bundle exec rackup config.ru --port $HTTP_PORT",
    wait:      {"retry": 20, "timeout": 1000},
    scalable:  {"default": 1},

    provision: [
      "bundle install --path /azk/bundler",
    ],
    mounts: {
      '/azk/#{manifest.dir}': path("."),
      '/azk/bundler': persistent("bundler"),
    },
    envs: {
      RUBY_ENV: "development",
      BUNDLE_APP_CONFIG: "/azk/bundler",
    },
  },
});



