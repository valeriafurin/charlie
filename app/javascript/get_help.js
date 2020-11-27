const choiceOne = document.getElementById(choice1)
const choiceTwo = document.getElementById(choice2)
const choiceThree = document.getElementById(choice3)

const toggleActive = (element) => {

  if element.classList.contains('active')
    element.classList.remove('active')
  else
    element.classList.add('active')
  end
}

choiceOne.addEventListener('click', (event) => event.classList.add('active'))
choiceTwo.addEventListener('click', (event) => event.classList.add('active'))
choiceThree.addEventListener('click', (event) => event.classList.add('active'))

export { toggleActive }