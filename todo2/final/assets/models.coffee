# The Todo model for the Backbone client:
class @Todo extends Backbone.Model
  # namespace JSON under 'todo' see backbone_sync.js
  paramRoot: 'todo'
  
  # Build the url, appending _id if it exists:
  url: ->
    u = "/todos"
    u += "/#{@get("_id")}" unless @isNew()
    return u
    
  # The default Backbone isNew function looks for 'id',
  # Mongoose returns "_id", so we need to update it accordingly:
  isNew: ->
    !@get("_id")?
  
  # Validate the model before saving:
  validate: (attrs) ->
    if !attrs.title? or attrs.title.trim() is ""
      return "Title can't be blank"
  
# The Todos collection for the Backbone client:
class @Todos extends Backbone.Collection
  model: Todo
  
  url: "/todos"