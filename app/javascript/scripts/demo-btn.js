const hideBtn = () => {
  document.getElementById("getdemo").classList.add("hide");
};

const setHideBtn = () => {
  // checking if the id exists on the element makes it possible to choose on which page it's goiing to be loaded
  const getDemo = document.getElementById("getdemo");
  if (getDemo) {
    window.setTimeout(hideBtn, 5000);
  }
};

export { setHideBtn };
