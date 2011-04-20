require 'spec_helper'

describe PagesController do
  integrate_views

  pages = [
    '/',
    '/projects', 
    '/about',
    '/about/work',
    '/about/press',
    '/contact',
    '/gfxCardStatus',
    '/gfxCardStatus/changelog',
    '/gfxCardStatus/faq',
    '/gfxCardStatus/features',
    '/gfxCardStatus/screenshots',
    '/compressify',
    '/compressify/support'
  ]
  
  pages.each do |page|
    describe "GET '#{page}'" do
      it "should be successful" do
        get "#{page}"
        response.should be_success
      end
    end
  end

  describe "GET '/blog'" do
    it "should be redirected" do
      get '/blog'
      response.should redirect_to("http://blog.codykrieger.com")

      get '/blog/somepage'
      response.should redirect_to("http://blog.codykrieger.com/somepage")
    end
  end

  describe "GET '/nonexistentpage'" do
    it "should not be successful" do
      get '/nonexistentpage'
      response.should 
    end
  end

end

