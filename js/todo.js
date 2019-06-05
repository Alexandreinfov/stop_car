$(function(){

	var url="http://localhost:8083/WEB/todo_list_bootstrap/php";

	function loadTarefas()
	{
		$('#tarefas-list').empty(); //Se tiver alguma coisa na tabela, apaga.

		$.getJSON(url+'/listar_tarefas.php', {id_usuario:5}).done(function(data)
		{
			for(var i=0; i<data.length; i++)
			{
				addTarefa(data[i].texto, data[i].id, data[i].status, data[i].data);
			}
		})
	}

	function addTarefa(texto, id, status, data)
	{
		var $tarefa=$('<tr/>').addClass('tarefa-item')
						.append($('<td/>').addClass('tarefa-id').text(id))
						.append($('<td/>').addClass('tarefa-data').text(function(){return data.replace(/^(\d{4})-(\d{2})-(\d{2})/, '$3/$2/$1');}))
						.append($('<td/>').addClass('tarefa-texto').text(texto))
						.append($('<td/>').addClass('tarefa-status')
								.append($('</span>')).addClass(function(){
									switch(status)
									{
										case "1": return'bad badge-primary';
										case "2": return'bad badge-warning';
										case "3": return'bad badge-success';
									}
								})
								.text(function()
								{
									switch(status)
									{
										case "1": return'Nova';
										case "2": return'Em andamento';
										case "3": return'Finalizada';
									}
								}))
						.append($('<td/>'));
						//data finalizar

		$('#tarefa-list').append($tarefa);
	}

	loadTarefas();
})