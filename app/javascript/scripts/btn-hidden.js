const showBtn = () => {
  document.getElementById("gethelp").classList.remove("hidden");
};

const setShowBtn = () => {
  // checking if the id exists on the element makes it possible to choose on which page it's goiing to be loaded
  const getHelp = document.getElementById("gethelp");
  if (getHelp) {
    window.setTimeout(showBtn, 5000);
  }
};

export { setShowBtn };
