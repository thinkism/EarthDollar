contract test{
  uint public data;
  function test(uint init) {
    data = init;
  }

  function setData(uint newData) {
    data = newData;
  }

  function getData() constant returns(uint retVal){
    return data;
  }
}