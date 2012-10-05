// Generated by CoffeeScript 1.3.3
(function() {

  define(['backbone', 'text!views/templates/pattern.html'], function(Backbone, templ) {
    var View, template;
    template = _.template(templ);
    return View = Backbone.View.extend({
      tagName: 'li',
      className: 'pattern',
      initilize: function() {},
      render: function() {
        this.$el.html(template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
