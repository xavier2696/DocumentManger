# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@tagEvent = ->
	tagContainer = document.getElementsByClassName("tag-elements")[0]
	tagInput= document.getElementsByClassName("tag-input")[0]
	onKeyPressFun =(e) ->
		if e.keyCode == 13 
			e.preventDefault()
			if $(tagInput).val() != ""
				tag = document.createElement("div")
				tag.className = "tag-element"
				tagText = document.createElement("span")
				tagText.textContent =$(tagInput).val()
				tagText.className = "tag-text";
				tag.appendChild(tagText)
				closeIcon = document.createElement("i")
				closeIcon.className = "tiny material-icons delete-tag"
				closeIcon.textContent = "close"
				close =(ev) ->
					this.parentElement.remove()
				closeIcon.onclick = close
				tag.appendChild(closeIcon)
				tagContainer.appendChild(tag)
				$(tagInput).val("")
		
	if tagInput
		tagInput.onkeypress = onKeyPressFun

