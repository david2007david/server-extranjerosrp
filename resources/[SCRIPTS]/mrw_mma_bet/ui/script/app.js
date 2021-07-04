const Menu = document.getElementById("Menu");
var sound = new Howl({
  src: ['./sound/Gong.mp3'],
  autoplay: false,
  loop: false,
  volume: 0.5,
  onend: function() {
    console.log('Finished!');
  }
});

window.addEventListener('message', function (event) {
    const item = event.data
    const status = item.status
    const name = item.name

    if (status == true){
        if (name == "menu"){
            createMenu(item.data)
            Menu.style.display = "block"
        }else{
            playSound()
        }
    }else{
        Menu.innerHTML = ""
        Menu.style.display = "none"
    }
})

function createMenu(data){
    let contentMenu = document.createElement("ul")
    Menu.appendChild(contentMenu)

    for (let index = 0; index < data.length; index++) {
        const element = data[index];

        contentMenu.innerHTML = contentMenu.innerHTML + `<li id="contentMenu-${index}">
            <h1 id="fighterName">${element.name}</h1>
            <p id="fighterDesc">Amateur mma fighter</p>
            <div id=data>
                <div id=cote-data>
                    <span><i class="fa fa-money" aria-hidden="true"></i></span>
                    <p>${element.bet}</p>
                </div>
                <div id=better-data>
                    <span><i class="fa fa-user-plus" aria-hidden="true"></i></span>
                    <p>${element.cote}</p>
                </div>
            </div>
            <button class="bet">Bet !</button>
        </li>`    
    }

    document.getElementById("contentMenu-0").addEventListener("click", function(e){
        e.preventDefault()

        fetch(`https://${GetParentResourceName()}/bet`, {
            method:"POST",
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body:JSON.stringify({
                id:1
            }),
        }).then(resp => resp.json()).then();
    })

    document.getElementById("contentMenu-1").addEventListener("click", function(e){
        e.preventDefault()

        fetch(`https://${GetParentResourceName()}/bet`, {
            method:"POST",
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body:JSON.stringify({
                id:2
            }),
        }).then(resp => resp.json()).then();
    })
}

function playSound(){
    sound.play()
}