$(document).ready(function(){
	$('#municipe_endereco_attributes_zipcode').on('blur',function(){
		let url = `https://viacep.com.br/ws/${$("#municipe_endereco_attributes_zipcode").val()}/json/`
		$.ajax({
			url: url,
			dataType: 'json',
			type: 'GET',
			success: function (response) {
				console.log(response)
				$("#municipe_endereco_attributes_address").val(response.logradouro);
				$("#municipe_endereco_attributes_neighborhood").val(response.bairro);
				$("#municipe_endereco_attributes_city").val(response.localidade);
				$("#municipe_endereco_attributes_state").val(response.uf);
				$("#municipe_endereco_attributes_ibge_code").val(response.ibge);
			}
		});
	})
})