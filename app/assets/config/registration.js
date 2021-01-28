function searchAsso() {

    let rna = document.getElementById("rna-field").value;

    const URL = 'https://entreprise.data.gouv.fr/api/rna/v1/id/' + rna;

    fetch(URL, {
            method: 'GET'
        })
        .then((response) => response.json())
        .then((response) => getInfo(response.association))
        .catch((error) => console.error(error));

}


function getInfo(response) {
    const result = document.getElementById("rna-result");
    if (response !== undefined) {
        let title = response.titre;
        let acronym = response.titre_court;
        fillFields(title, acronym)
        document.getElementById("rna-field").readOnly = true;
        result.innerHTML = `<h6 style="color:green;">RNA valide</h6>`;
    } else {
        result.innerHTML = `<h6 style="color:red;">RNA non trouvé, veuillez renseigner un code valide svp</h6>`;
    }
}

function fillFields(title, acronym) {
    let name = document.getElementById("name-field");
    let shortname = document.getElementById("acronym-field");
    name.value = title;
    shortname.value = acronym;
}