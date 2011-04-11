require('/javascripts/jquery.js')
require('/javascripts/core.js')

describe('Ql core', function () {
  it("should return a QL object" , function() {
    expect(Ql).toBeTypeOf('object');
  })

  it("should be a Ql object" , function() {
    expect(Ql).toBe(window.Ql);
  })

  describe('Ql helpers', function() {
    var testArray = ['a','b','c'],
    resultObject = {a:'',b:'',c:''};

    it('should find the string in the array', function(){
      expect(Ql.helpers.arraySearch(testArray)).toEqual(resultObject);
    })

  })

})
