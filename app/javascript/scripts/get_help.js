const choiceOne = document.getElementById('choice1')
const choiceTwo = document.getElementById('choice2')
const choiceThree = document.getElementById('choice3')

const toggleActive = (element) => {
  if (element.classList.contains('active')) {
    element.classList.remove('active')
  } else {
    choiceOne.classList.remove('active')
    choiceTwo.classList.remove('active')
    choiceThree.classList.remove('active')
    element.classList.add('active')
  }
}
choiceOne.addEventListener('click', () => toggleActive(choiceOne))
choiceTwo.addEventListener('click', () => toggleActive(choiceTwo))
choiceThree.addEventListener('click', () => toggleActive(choiceThree))


export { toggleActive }