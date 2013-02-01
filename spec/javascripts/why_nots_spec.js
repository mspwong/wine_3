describe('why nots', function() {

  var $fixture;

  beforeEach(function() {
    $fixture = $('<div id="fixture"></div>').appendTo($('body'));
  });

  afterEach(function() {
    $fixture.remove();
  });

  describe('::showsWine', function() {
    it('shows wine', function() {
      $('<div id="ajax_response"></div>').appendTo($fixture);
      spyOn($.ajaxSettings, 'success');
      var json = {abc: 1, xyz: 99};
      whyNots.showWine(json);

      expect($('#ajax_response p')).toHaveHtml(JSON.stringify(json));
      expect($.ajaxSettings.success).toHaveBeenCalled();
    });
  });

});