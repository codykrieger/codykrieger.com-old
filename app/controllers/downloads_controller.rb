class DownloadsController < ApplicationController
  
  def download_file
    path = params[:file].to_s.gsub(/\.\./, '').gsub(/~/, '')
    file = path.split('/').last

    download = Download.find_or_create_by_file(file)
    download.count += 1
    download.save

    send_file "#{Rails.root}/downloads/#{file}"

    render :nothing => true
  end

end
