class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new #最初の画面(新規投稿)----
  end

  def create  #投稿(登録)？
    # 1.&2.  データを受け取り新規登録するためのインスタンス作成
    #list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    #list.save
    # 4. トップ画面へリダイレクト
    #redirect_to list_path(list.id)
    @list = List.new(list_params) #8章の内容↓
    if @list.save
      #フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      @lists = List.all
      flash.now[:alert] = "投稿に失敗しました。"
      render :new #9章 newからindexに変更(renderだとインスタンス変数変更されるから)
    end
  end

  def index  #投稿一覧----
    @lists = List.all # @listsはインスタンス変数
                      # @List.allでlistテーブルに保存されている全てのデータを取得することができる。
  end

  def show #詳細画面----
    @list = List.find(params[:id])  #レコード1件のみ取得するので今回のインスタンス変数名は@list
                                    #findメソッドは引数を受け取り、idカラムを引数と比べて
                                    #同じidのレコードを取得してくるメソッド。
  end

  def edit  #編集機能
    @list = List.find(params[:id])
  end

  def update #更新機能(コントローラー内でのみローカル変数をshowに送る)
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy #削除機能
    list = List.find(params[:id]) #データ(レコード)を1件取得
    list.destroy #データ(レコード)を削除
    redirect_to '/lists' #投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image) #受け取るデータを指定！
  end
end
