class SongsController < ApplicationController
  skip_before_filter :verify_authenticity_token
    
  # GET /songs
  # GET /songs.xml
  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @songs }
    end
  end

  def list
    index
  
  end
  # GET /songs/1
  # GET /songs/1.xml
  def show
    @song = Song.find(params[:id])
    notes = []
#    @pyoutput = %x[python public/system/hello-world.py #{@song.midi.url} #{@song.vocal.url}]
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song }
    end
  end

  #GET /download/
  def download
    @song = Song.find(params[:id])
    send_file("public"+eval("@song.#{params[:file]}.url.split('?')[0]"),:type=>"application/midi")
  end
  
  # GET /songs/new
  # GET /songs/new.xml
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
    params.keys.each do |param|
      if @song.has_attribute?(param.to_s):
        @song[param] = params[param] ? params[param] : @song[param]
      end
    end
    if @song.save
          dir_path= ".\\public\\system\\midis\\"+@song.id.to_s+ "\\original"
          %x[mkdir #{dir_path}]
          puts %x[python public/system/FinalCode/SemiAutoComposeSong.py generated #{genre.to_s} #{key.to_s} Tonics #{chordProgression} #{numPhrase} #{tempo} #{dir_path} #{coords}]
          puts %x[python public/system/FinalCode/SemiAutoComposeSong.py melody #{genre.to_s} #{key.to_s} Tonics "" #{numPhrase} #{tempo} #{dir_path} #{coords}]
          @song.midi_file_name= "generated.mid"
          puts @song.midi
          @song.melody_file_name = "melody.mid"
          puts @song.melody
    end

    respond_to do |format|
      format.html
      format.json {render :json => @song}
    end
  end

  # POST /songs
  # POST /songs.xml
  def create
    coords = params[:coords]
    tempo = params[:tempo] ? params[:tempo] : '48'
    genre = params[:genre] ? params[:genre] : 'CountryPop'
    key = params[:key] ? params[:key] : 'A'
    chordProgression = params[:chordProgression] ? params[:chordProgression] : 'cp1'
    numPhrase = params[:numPhrase] ? params[:numPhrase] : '8'
    avatar = params[:avatar] ? params[:avatar] : File.open("./public/images/#{genre}-Icon.png")
    vocal = params[:vocal] ? params[:vocal] : File.open("./public/system/test.wav")
#    avatar = params[:avatar] ? params[:avatar] : File.open('./public/images/CountryPop-Icon.png')

    @song = Song.create(:name => params[:name],:coords => coords, :genre => genre,
                        :tempo => tempo, :key => key, :chordProgression => chordProgression,
                        :numPhrase => numPhrase, :avatar => avatar, :vocal => vocal)
    if @song.save
      dir_path= ".\\public\\system\\midis\\"+@song.id.to_s+ "\\original"
      %x[mkdir #{dir_path}]
      puts %x[python public/system/FinalCode/SemiAutoComposeSong.py generated #{genre.to_s} #{key.to_s} Tonics #{chordProgression} #{numPhrase} #{tempo} #{dir_path} #{coords}]
      puts %x[python public/system/FinalCode/SemiAutoComposeSong.py melody #{genre.to_s} #{key.to_s} Tonics "" #{numPhrase} #{tempo} #{dir_path} #{coords}]
      @song.midi_file_name= "generated.mid"
      puts @song.midi
      @song.melody_file_name = "melody.mid"
      puts @song.melody

      puts %x[python public/system/FinalCode/AutoTune.py #{dir_path}]
      @song.autotuned_file_name = "autotuned.wav"
      puts @song.autotuned
    end

    respond_to do |format|
      if @song.save
        format.html { redirect_to(@song, :notice => 'Song was successfully created.') }
        format.xml  { render :xml => @song, :status => :created, :location => @song }
        format.json {render :json => @song}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.xml
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to(@song, :notice => 'Song was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.xml
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to(songs_url) }
      format.xml  { head :ok }
    end
  end
end
