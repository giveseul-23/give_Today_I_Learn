const toDoform = document.querySelector(".js-toDoForm"),
    toDoInput = toDoform.querySelector("input"),
    toDoList = document.querySelector(".js-toDoList");

const TODOS_LS = 'toDos';

let toDos = [];

function savaToDos(){
    localStorage.setItem(TODOS_LS, JSON.stringify(toDos)); // obj -> string
}

function deleteToDo(event){
    const btn = event.target;
    const li = btn.parentNode;
    toDoList.removeChild(li);
    const cleanToDos = toDos.filter(function(toDo){
        return toDo.id !== parseInt(li.id);
    });
    toDos = cleanToDos;
    savaToDos();
}

function paintToDo(text){
    const li = document.createElement("li"); //태그생성
    const delBtn = document.createElement("button");
    delBtn.innerText = "❌";
    delBtn.addEventListener("click", deleteToDo);
    const span = document.createElement("span");
    const newId = toDos.length + 1;
    span.innerText = text;
    li.appendChild(delBtn);
    li.appendChild(span);
    li.id = newId; //id값
    toDoList.appendChild(li);

    const toDoObj = {
        text: text,
        id: newId
    }
    toDos.push(toDoObj);
    savaToDos();
}

function handleSubmit(event){
    event.preventDefault();
    const currentValue = toDoInput.value;
    paintToDo(currentValue);
    toDoInput.value="";
}

function loadToDos(){
    const loadToDos = localStorage.getItem(TODOS_LS);
    if(loadToDos !== null){
        const parsedToDos = JSON.parse(loadToDos); //obj
        parsedToDos.forEach(function(toDo){
            paintToDo(toDo.text);
        })
    }
}

function init(){
    loadToDos();
    toDoform.addEventListener("submit", handleSubmit);
}

init();