class DownloadsController < ApplicationController
  
  def download_file
    path = params[:file].to_s.gsub(/\.\./, '').gsub(/~/, '')
    file = path.split('/').last
    
    download = Download.find_or_create_by_file(file)
    download.count += 1
    download.save
    
    response.headers['X-Accel-Redirect'] = "/storage/#{path}"
    response.headers['Content-Type'] = 'application/octet-stream'
    response.headers['Content-Disposition'] = "attachment; filename=#{file}"
    
    render :nothing => true
  end
  
end
