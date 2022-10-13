//
//  RepositoryMock.swift
//  PruebaiOSTests
//
//  Created by Cristian Ayala on 12/10/22.
//

@testable import PruebaiOS
import Foundation

class RepositoryMock: GoRestRepositoryProtocol, RestAPI {
    func getGoRestData(request model: RequestModel, completion: @escaping (ResponseAPI<ListEntity>) -> Void) {
        let data = Data(jsonMock.utf8)
        decode(data: data, completion: completion)
    }
}

fileprivate var jsonMock = """
{
    "meta": {
        "pagination": {
            "total": 80,
            "pages": 8,
            "page": 1,
            "limit": 10,
            "links": {
                "previous": null,
                "current": "https://gorest.co.in/public/v1/posts?page=1",
                "next": "https://gorest.co.in/public/v1/posts?page=2"
            }
        }
    },
    "data": [
        {
            "id": 1557,
            "user_id": 3212,
            "title": "Adinventitias subnecto vinitor deleo magnam delego sit cohibeo depromo celo vir uredo vitae bardus timor aestas venio unde.",
            "body": "Aut coerceo abduco. Vinum venia ante. Aliqua conculco conitor. Coaegresco truculenter temeritas. Uxor atrocitas amicitia. Arto dedecor solvo. Desino coerceo teneo. Claro supplanto volutabrum. Crinis eum comburo. Alioqui abscido administratio. Recusandae argumentum iusto. Volutabrum solvo clamo. Vestrum auditor auctor. Talis sub beatus. Arx sursum usitas. Neque aliquid amicitia. Ambulo minima uter. Demoror accedo aggredior. Ubi comminor aufero."
        },
        {
            "id": 1547,
            "user_id": 3182,
            "title": "Vinitor vinco demitto asper patria caput abbas virga culpa deputo ut ambulo astrum.",
            "body": "Cresco cunctatio abduco. Tantum avaritia qui. Compello undique aequus. Aliquam cedo cetera. Tondeo tamen totidem. Studio deorsum uberrime. Crux molestiae quis. Soleo corrumpo voluptas. Aggero ea creo. Celo contra vilis. Celebrer aqua decretum. Trado solum thalassinus. Ascisco demens utpote. Claudeo apud antea. Vilis turpis alo. Cado deputo provident. Vereor asporto bibo. Damnatio condico non. Cur vel desolo."
        },
        {
            "id": 1498,
            "user_id": 3085,
            "title": "Nihil cultellus curriculum crustulum virgo depopulo decet vinculum turpe blanditiis civitas absum amplexus depereo balbus agnosco valde corpus sufficio.",
            "body": "Sumo clarus congregatio. Toties beatae cultura. Censura cogo comis. Subiungo utrum validus. Spero coaegresco minima. Debilito concido aestivus. Cotidie culpo est. Aestus pauci volaticus. Doloremque nihil velut. Sto averto virga. Sit auxilium congregatio. Surgo solium cometes. Quibusdam conitor demoror. Uter alter molestiae. Curtus atqui tantum. Sperno brevis solutio. Volup vociferor universe. Animi aegrotatio atque. Currus thorax textilis. Voluptas accommodo sophismata."
        },
        {
            "id": 1451,
            "user_id": 2982,
            "title": "Utilis spectaculum damnatio sollicito conduco sub ventus vinum pel valde traho caterva contego debeo cauda praesentium verbum clarus.",
            "body": "Approbo autem conqueror. Color et alius. Virgo cras tero. Provident et adficio. Virgo somnus conscendo. Vorago ater peior. Neque candidus blanditiis. Umquam cum debilito. Veritatis expedita antiquus. Possimus denuncio autem. Aegrotatio compono charisma. Tabella vestrum fuga. Valde coadunatio synagoga. Calamitas arceo curatio. Laudantium decipio vociferor. Alii facilis tersus. Vel comburo compono. Tener decipio terebro."
        },
        {
            "id": 1439,
            "user_id": 2960,
            "title": "Conventus trucido valetudo alias curia corona qui aut coadunatio unus voluptatem vinculum appositus anser hic bellicus ea.",
            "body": "Supra sollers tendo. Deduco ademptio tametsi. In campana deinde. Quo validus casso. Clibanus barba crux. Deprecator deludo tergiversatio. Incidunt tamisium spero. Rem comminor subseco. Vinculum asper inventore. Umerus sint conturbo. Molestiae tamisium aduro. Dedico deleniti repellat. Decumbo addo depono. Demoror apparatus veritas. Ater eveniet canonicus. Vorax centum substantia. Conventus suspendo callide. Solio auditor currus."
        },
        {
            "id": 1431,
            "user_id": 2937,
            "title": "Vindico cariosus odit asporto quia cattus velit.",
            "body": "Thorax vultuosus patior. Thema acsi clam. Ut maiores vesco. Thema dolores adiuvo. Addo nemo audentia. Incidunt suspendo argentum. Termes pecus tribuo. Aperio absens demum. Umquam natus sequi. Aer stipes unde. Vulpes caterva autem. Ea demens debitis. Suspendo videlicet nemo. Amplitudo capto creator. Cubo cibus vinitor. Cicuta error suus. Terga omnis velit. Sed vestrum desidero."
        },
        {
            "id": 1406,
            "user_id": 2888,
            "title": "Eum surculus vulnero curtus audentia non taedium vinitor et viriliter cito adinventitias turpe demulceo tollo alias ut.",
            "body": "Comptus aut neque. Celer ex qui. Combibo fuga coniuratio. Caute omnis capio. Valeo tero accommodo. Tracto collum soluta. Calco barba defessus. Vorago convoco sed. Accipio pel deinde. Contigo amet recusandae. Voluptate amissio animi. Chirographum mollitia decens. Cunabula suggero defendo. Bibo minus carmen. Dicta expedita voluptas."
        },
        {
            "id": 1376,
            "user_id": 2839,
            "title": "Ante atqui bonus deleniti canonicus molestias armarium defetiscor vindico dapifer vitae colo beatus aveho.",
            "body": "Vulgo decerno subito. Vitium tamdiu quod. Velociter caelum chirographum. Deputo voluptatem conqueror. Adulescens spiculum adduco. Aufero subseco virtus. Benevolentia tero utroque. Cribro antea abduco. Velit aro voro. Enim canonicus debilito. Pariatur credo solvo. Colloco deputo cultura. Demulceo caries sulum. Aut utilis urbanus. Coniuratio correptius alii."
        },
        {
            "id": 1354,
            "user_id": 2798,
            "title": "Theatrum degenero advenio aeger est voluptate charisma depopulo tardus harum adduco vinum.",
            "body": "Solus admiratio aliqua. Custodia colligo admitto. Addo textor auditor. Acer vitae acidus. Impedit coaegresco anser. Summa vigilo audacia. Voluptatem velociter celer. Cubicularis tibi voluptates. Victus colligo dolorem. Curatio non accusamus. Capitulus vel repellat. Viriliter adfectus ver. Conservo absum ab. Video cornu valens. Tener viriliter vulnus. Voluptas maiores vis. Stipes vindico bellum. Una cultura patria."
        },
        {
            "id": 1339,
            "user_id": 2772,
            "title": "Timidus adiuvo theologus vester ventus iste thermae abscido vindico repudiandae reiciendis.",
            "body": "Ut eaque audeo. Illum adstringo tricesimus. Conicio stipes cognomen. Cometes coerceo sollicito. Et at curis. Caput ascisco aliquid. Sulum summisse sed. Vomica depromo canonicus. Xiphias pecto unde. Rem labore vulgivagus. Tertius complectus explicabo. Theologus acerbitas adsidue. Adulatio odio comis. Tum decimus nihil. Theologus autem utrum."
        }
    ]
}
"""
