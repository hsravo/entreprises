module ApplicationHelper

    require 'open-uri'
    require 'net/http'
  
  
    def get_rna_asso_by_official_id(official_id)
      result = get_rna_asso_by_rna(official_id)
      return result if result.present?
  
      sleep(2)
      result = get_rna_asso_by_siret(official_id)
      return result if result.present?
      puts result
    end
  
    def get_rna_asso_by_rna(rna, new_attempt = false)
      uri = URI("#{ENV['ASSOS_GOUV_API_URL']}id/#{rna.gsub(/\s/, '')}")
  
      response = Net::HTTP.get(uri).force_encoding(Encoding::UTF_8)
      unless response.blank?
        begin
          json = JSON.parse(response)
        rescue JSON::ParserError => e
          return nil if new_attempt
          sleep(2)
          return get_rna_asso_by_rna(rna, true)
        end
  
        return nil unless json.present?
  
        unless json['message'].present? && json['message'] == "no results found"
          asso_infos = json['association']
          return nil if asso_infos.nil? || asso_infos['erreur'].present?
  
          return retrieve_asso_infos(asso_infos)
        end
      end
    end
  
    def get_rna_asso_by_siret(siret, new_attempt = false)
      uri = URI("#{ENV['ASSOS_GOUV_API_URL']}siret/#{rna.gsub(/\s/, '')}")
  
      response = Net::HTTP.get(uri).force_encoding(Encoding::UTF_8)
      unless response.blank?
        begin
          json = JSON.parse(response)
        rescue JSON::ParserError => e
          return nil if new_attempt
          sleep(2)
          return get_rna_asso_by_rna(rna, true)
        end
  
        return nil unless json.present?
  
        unless json['message'].present? && json['message'] == "no results found"
          asso_infos = json['association']
          return nil if asso_infos.nil? || asso_infos['erreur'].present?
  
          return retrieve_asso_infos(asso_infos)
        end
      end
    end
  
  
    private
  
    def retrieve_asso_infos(asso_infos)
      return {name: asso_infos['titre'],
              official_id: asso_infos['id_association'],
              acronym: asso_infos['titre_court'],
              rna_id: asso_infos['id_association'],
              ex_id: asso_infos['id'],
              ex_source: ENV['ASSOS_GOUV_API_URL'],
              siren_id: asso_infos['siren'],
              siret_id: asso_infos['siret'],
              official_creation_date: asso_infos['date_creation'],
              official_publication_date: asso_infos['date_publication_creation'],
              statutory_object: asso_infos['objet'].gsub("\n", ""),
              street_address: [asso_infos['adresse_gestion_libelle_voie'], asso_infos['adresse_gestion_acheminement']].join(', '),
              postal_code: asso_infos['adresse_gestion_code_postal'],
              locality: asso_infos['adresse_gestion_acheminement'],
              official_postal_address: [asso_infos['adresse_gestion_libelle_voie'], asso_infos['adresse_gestion_code_postal'], asso_infos['adresse_gestion_acheminement'], asso_infos['adresse_gestion_pays']].join(', '),
              contact_email: asso_infos['email'],
              contact_phone: asso_infos['telephone'],
              website: asso_infos['site_web']
            }
    end
  
end
