# The 'main' Backbone view of the application
class @TodoListView extends Backbone.View
  
  el: '#todos'
  
  initialize: ->
    @template = _.template(Templates.list_item_template)
    @collection.bind("reset", @render)
    @collection.fetch()
    
  render: =>
    @collection.forEach (todo) =>
      $(@el).append("<li>#{@template(todo.toJSON())}</li>")