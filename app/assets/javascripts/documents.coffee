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

@onChangeReceiverDepartment= (departmentId)->

	usersReceiverSelect  = document.getElementsByClassName("receiver-select")[0]
	parent = usersReceiverSelect.parentElement
	select = $(usersReceiverSelect).find(".receiver-select").clone()
	select.empty()
	usersReceiverSelect.remove()
	gon.usersReceiver.map((user,index) ->
		
			if parseInt(user.department_id)== parseInt(departmentId)
				option = document.createElement("option")
				option.setAttribute("value",user.id)
				option.textContent = user.username+"-"+user.email
				select[0].appendChild(option)
			
		)
	parent.appendChild(select[0])
	$(select).material_select()


@onChangeReceiverUser= (userId)->
	console.log userId
	departmentReceiverSelect  = document.getElementsByClassName("receiver-department-select")[0]
	parent = departmentReceiverSelect.parentElement
	select = $(departmentReceiverSelect).find(".receiver-department-select").clone()
	departmentReceiverSelect.remove()

	i = 0
	while i < gon.usersReceiver.length
		if parseInt(gon.usersReceiver[i].id) == parseInt(userId)
			select.val gon.usersReceiver[i].department_id
			break
		i++
	parent.appendChild(select[0])
	$(select).material_select()


	