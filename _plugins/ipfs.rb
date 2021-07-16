Jekyll::Hooks.register :site, :post_write do |page|
  @finder = "find _site -name '*html' -type f -exec "
  @matchers = {} 
  Dir['_site/assets/vendor/*'].each do |vendor|
    @matchers[vendor] = "/vendor/" + File.basename(vendor)
  end
  @matchers['_site/assets/css'] = '/css'
  #puts @matchers
  @matchers.each do |location,matcher|
    @cid = `ipfs add --pin=false -r #{location} -Q --cid-version=1 --wrap-with-directory`
    @cid = @cid.strip
    print matcher," ",@cid,"\n"
    @dirname = File.basename(matcher)
    print `#{@finder} perl -pi -e 's#<[ ]*ipfs_asset>#{matcher}(.*?)"#/ipfs/#{@cid}/#{@dirname}\\1"#g' {} +`
    print `mkdir -p _site/ipfs/#{@cid}/ && mv #{location} "$_"`
  end
  print `#{@finder} grep '<[ ]*ipfs_asset>' {} +`
end


