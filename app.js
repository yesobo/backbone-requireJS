// Generated by CoffeeScript 1.3.3

/*
Paths section
*/


(function() {

  require.config({
    baseUrl: "C:/desarrollo/webdev/bbb-requireJS/js",
    paths: {
      jquery: 'lib/jquery-1.8.2',
      underscore: 'lib/underscore-1.3.3',
      backbone: 'lib/backbone-0.9.2'
    },
    shim: {
      underscore: {
        exports: "_"
      },
      backbone: {
        deps: ['underscore', 'jquery'],
        exports: 'Backbone'
      }
    }
  });

  require(['jquery', 'backbone', 'models/Pattern', 'views/MasterView'], function($, Backbone, Pattern, MasterView) {
    var Router, router;
    Router = Backbone.Router.extend({
      routes: {
        "": "main"
      },
      main: function() {
        var patterns, view;
        patterns = new Pattern.Collection();
        view = new MasterView({
          collection: patterns
        });
        return patterns.fetch({
          url: "http://localhost:8010/api/patterns",
          error: function(collection, response) {
            console.log('error al hacer FETCH en app');
            return console.log(response);
          },
          success: function(collection, response) {
            console.log('FETCH realizado correctamente');
            return $('#Container').html(view.render().el).show();
          }
        });
      }
    });
    router = new Router();
    return Backbone.history.start();
  });

}).call(this);
