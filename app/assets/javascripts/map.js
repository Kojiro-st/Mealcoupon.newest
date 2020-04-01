class @CurrentLocations
  @getCurrentLocation: ->
    $('.currentLocation').on 'click', ->
      if navigator.geolocation
        navigator.geolocation.getCurrentPosition(successGetPosition, failGetPosition, options)
      else
        message = 'ご使用中のブラウザは現在地検索に対応されておりません。'
        Alert.set('warning', message)

  successGetPosition = (position) ->
    window.location.href = "/shops/searches?latitude=#{position.coords.latitude}&longitude=#{position.coords.longitude}"

  options =
    enableHighAccuracy: true

  failGetPosition = (error) ->
    switch error.code
      when 1
        message = '位置情報の提供を許可してください。'
      when 2
        message = '位置情報の取得に失敗しました。'
    Alert.set('warning', message)