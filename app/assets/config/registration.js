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
        let codegestion = response.code_gestion;
        let codepostal = response.adresse_code_postal;
        let datecreation = response.date_creation;
        let ville = response.adresse_libelle_commune;
        fillFields(title, codegestion, codepostal, datecreation, ville)
        document.getElementById("rna-field").readOnly = true;
        result.innerHTML = `<h6 style="color:green;">RNA valide</h6>`;
    } else {
        result.innerHTML = `<h6 style="color:red;">RNA non trouvé, veuillez renseigner un code valide svp</h6>`;
    }
}

function fillFields(title, codegestion, codepostal, datecreation, ville) {
    let name = document.getElementById("name-field");
    let codegest = document.getElementById("codegestion-field");
    let codepost = document.getElementById("codepostal-field");
    let creadate = document.getElementById("date-field");
    let creaville = document.getElementById("ville-field");
    name.value = title;
    codegest.value = codegestion;
    codepost.value = codepostal;
    creadate.value = datecreation;
    creaville.value = ville;
}