$(function(){
  var App = {};
  window.App = App; 
  var todos = [];
  //              [{id: 1, title: "Walk the dog!", completed: false},
  //              {id: 2, title: "Laundry!", completed: true},
  //              {id: 3, title: "Finish the lab", completed: false},
  //              {id: 4, title: "Sleep", completed: false},
  //              {id: 5, title: "Eat", completed: true}];
                      
  App.models = todos;

  App.findModel = function(id){
    var foundModel;
   $(this.models).each(function(index, item){
      if(item.id === id){
        foundModel = item;
      }
   });
   return foundModel;
  };

  

  // // // We might say App.setTarget("#todos"), 
  // // //      which is where we will append todos
  App.setTarget = function(sel){
    this.targetSel = sel;
    this.$target = $(sel);
    return this;
  }; 
  // // // We might say App.setTemplate("todo"), 
  // // //      which is what we will use to make todos
  App.setTemplate = function(name){
    this.template = HandlebarsTemplates[name];
    return this;
  };
  
  // // Chaining example:
  // // App.setTarget("#todos").setTemplate("todo")
  
  // // We might say App.setTargetTemplate("#todos", "todo")
  App.setTargetTemplate = function(sel, name){
    this.setTarget(sel).setTemplate(name);
    return this;
  };

  App.render = function(item){
     this.$el = $(this.template(item));
     this.$target.append(this.$el);
     return this;
  };

  App.doThis = function(func){
    func.apply(this);
    return this;
  };

  App.urls = {
    index: {path: '/todos.json', method: 'get'},
    create: {path: '/todos.json', method: 'post'}
  };

  App.getItems = function(callback){
    $.ajax({
      url: this.urls.index.path,
      type: this.urls.index.method
    }).done(callback);
  };

  // App.doThis(function(){
  //   $(this.models).each(function(index, todoModel){
  //       var $todo = $(HandlebarsTemplates.todo(todoModel));
  //       $("#todos").append($todo);
  //   });
  // });

  // App.setTargetTemplate("#todos", "todo")
  //   .doThis(function(){
  //     var _this = this; //because this is set as a jQuery object [ie.$(this.models)], must pass the scope
  //     $(this.models).each(function(index, todoModel){
  //       _this.render(todoModel);
  //       // console.log(this);
  //   });
  // });

  App.renderAllModels = function(){
    var _this = this;
    $(this.models).each(function(index, todoModel){
        _this.render(todoModel);
    });
      return this;
  };

  App.saveModel = function(model, callback){
    // DO SOME STUFF HERE
    var data = {todo: model};
    $.ajax({
      url: this.urls.create.path,
      type: this.urls.create.method,
      data: data
    }).done(callback);
   
  };

  App.updateItem = function(model, callback){
    //do something here like send a patch
    callback(model);
  };

  App.setTargetTemplate("#todos", "todo")
  .renderAllModels().doThis(function(){
    var _this = this;
    // Add new models from a form
    $("#addTodo").on("submit",function(event){
      event.preventDefault();
      var newTodo = {completed: false};
      newTodo.title = $("#todo_title").val();
      
      _this.saveModel(newTodo, function(data){
        _this.models.push(data);
        _this.render(data);
      });
    });
      
  });

  App.doThis(function(){
    var _this = this;
    //checkbox eventhandler
    $("#todos").on("click", ".todo", function(event){
      console.log(this.dataset); //.dataset or $.data shows the data
      var id = Number(this.dataset.id);
      if(event.target.name === "completed"){
        var view = this;
        var todo = _this.findModel(id);
        todo.completed = !todo.completed;
        _this.updateItem(todo, function(data){
          $(view).toggleClass("done-true");
        });
      }
    });
  });

  App.doThis(function(){
    var _this = this; // because getItems is called with a callback, this changes the scope
    
    _this.getItems(function(responseData){
      _this.models = _this.models.concat(responseData); //model or models
      _this.renderAllModels();
      });
    
    });


});





// ////

//     $(function(){
//         var App = {};
//         window.App = App;
        
//          App.models = [{id: 1, title: "Walk the dog!", completed: false},
//                      {id: 2, title: "Laundry!", completed: true},
//                      {id: 3, title: "Finish the lab", completed: false},
//                      {id: 4, title: "Sleep", completed: false},
//                      {id: 5, title: "Eat", completed: true}]; 
//         // [1,2,3].each do 
//         //     #something
//         // end
//         // $.each([1,2,3], function(){
            
//         // })
        
//          /* Thought for later...
//          this.models.every(function(index, item){
//                 if(item.id === id){
//                     foundModel = item
//                     return false;
//                 } else {
//                     return true;
//                 }
//            });*/
//         App.findModel = function(id){
//             var foundModel;
//            $(this.models).each( function(index, item){
//                 if(item.id === id){
//                     foundModel = item;
//                 }
//            });
//            return foundModel;
//         };
        
//         // We might say App.setTarget("#todos"), 
//         //      which is where we will append todos
//         App.setTarget = function(sel){
//             this.targetSel = sel;
//             this.$target = $(sel);
//             return this;
//         }; 
//         // We might say App.setTemplate("todo"), 
//         //      which is what we will use to make todos
//         App.setTemplate = function(name){
//           this.template = HandlebarsTemplates[name];
//           return this;  
//         };
        
//         // Chaining example:
//         // App.setTarget("#todos").setTemplate("todo")
        
//         // We might say App.setTargetTemplate("#todos", "todo")
//         App.setTargetTemplate = function(sel, name){
//             this.setTarget(sel).setTemplate(name);
//             return this;
//         };
        
//         App.render = function(item){
//            this.$el = $(this.template(item));
//            this.$target.append(this.$el);
//            return this;
//         };
        
        
//         // Abstracted away 
//         App.renderAllModels = function(){
//             var _this = this;
//             $(this.models).each(function(index, todoModel){
//                 _this.render(todoModel);
//             });
//             return this;
//         };
//         // TIM TIME
//         App.saveModel = function(model, callback){
//             // DO SOME STUFF HERE
//             this.count += 1;
//             model.id = this.count;
//             callback(model);
//         };
//         // Send a put
//         App.updateItem = function(model, callback){
//             // DO SOMETHING HERE
//             callback(model);  
//         };
//         App.doThis = function(func){
//           func.apply(App);
//           return this;
//         };
//         App.setTargetTemplate("#todos", "todo")
//         .renderAllModels()
//         .doThis(function(){
//             var _this = this;
//             // Add new models from a form
//             $("#addTodo").on("submit",function(event){
//                 event.preventDefault();
//                 var newTodo = {completed: false};
//                 newTodo.title = $("#todo_title").val();
                
//                 _this.saveModel(newTodo, function(data){
//                     _this.models.push(data);
//                     _this.render(data);
//                 });
//             });
//         });
        
//         App.doThis(function(){
//             var _this = this;
            
//             //CHECKBOX EVENTHANDLER
//             $("#todos").on("click", ".todo", function(event){
//                console.log(this.dataset); 
//                var id = Number(this.dataset.id);
//                if(event.target.name === "completed"){
//                    var view = this;
//                    var todo = _this.findModel(id);
//                    todo.completed = !todo.completed;
//                    _this.updateItem(todo, function(data){
//                         $(view).toggleClass("done-true");
//                    });
//                }
//             });
//         });
//     });