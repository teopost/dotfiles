# http://am.apexnet.it/api_sonnleonardo/v1/progetti/ib.sonnleonardo/clientiPaginazione/doc_test?&offset=1&limit=10&count=0
# https://github.com/Apex-net/iOrder/blob/master/src/igamma/AppDelegate%2BRestKit.m
# https://github.com/Apex-net/iOrder/tree/3.3.0/src/igamma/AppDelegate%2BRestKit.m
# http://test.apexnet.it/appmanager/api/v1/help/operations/GetListaClientiDocumentiTestatePaginazione#response-json

import urllib2
import re
import sys

def estrai_proprieta_github(valore, sorgente):
    regexpval = '\[' +valore + 'Mapping addAttributeMappingsFromDictionary:@{(?P<pp>.*?)}];'
    tok = re.search(regexpval, sorgente, re.S|re.I)
    vals = tok.group("pp")
    lista = vals.split(",")
    inc=0
    dato=[]
    for elem in lista:
        riga=elem.split(":")[0].replace("@","").replace("\n","").replace(" ","").replace('"','')
        if riga<>"":
	       dato.append(riga)
    print "..on git" + ' [' + str(len(dato)) + ']'
    return dato
	
def estrai_proprieta_ws(sorgente):
    regexpval = '"object":\[{(?P<pp>.*?)}]'
    tok = re.search(regexpval, sorgente, re.S|re.I)
    vals = tok.group("pp")
    lista = vals.split(",")
    inc=0
    dato=[]
    for elem in lista:
        riga=elem.split(":")[0].replace("@","").replace("\n","").replace(" ","").replace('"','').strip()
        #print '>>>' + riga
        if riga<>"":
	       dato.append(riga)

    print '..on ws ' + ' [' + str(len(dato)) + ']'
    return dato

def compare_list(lista_dati_ws, lista_dati_git):
    print '..diff: only on ws'
    new_list = []
    for element in lista_dati_ws:
        if not element in lista_dati_git:
           print '   ' + element

    print '..diff: only on git'
    new_list = []
    for element in lista_dati_git:
        if not element in lista_dati_ws:
           print '   WARNING:' + element

		   
    print ''

def compare_list2(lista_dati_ws, lista_dati_git):
    
    new_list = set(lista_dati_ws + lista_dati_git)
	
    for element in new_list:
        if element in lista_dati_ws:
            sys.stdout.write(element)
        if element in lista_dati_git:
	        sys.stdout.write(element)
        print ''
    print ''

	
# == Main
print "Read from github..."

# Ramo master
# git='https://raw.github.com/Apex-net/iOrder/master/src/igamma/AppDelegate+RestKit.m?token=2573389__eyJzY29wZSI6IlJhd0Jsb2I6QXBleC1uZXQvaU9yZGVyL21hc3Rlci9zcmMvaWdhbW1hL0FwcERlbGVnYXRlK1Jlc3RLaXQubSIsImV4cGlyZXMiOjEzODU2NDYyNjZ9--497d6f068d8c1dc48c4b7255be16e58f0e2b1bc0'
# Ramo 3.3.0
git='https://raw.githubusercontent.com/Apex-net/iOrder/master/src/igamma/AppDelegate+RestKit.m?token=2573389__eyJzY29wZSI6IlJhd0Jsb2I6QXBleC1uZXQvaU9yZGVyL21hc3Rlci9zcmMvaWdhbW1hL0FwcERlbGVnYXRlK1Jlc3RLaXQubSIsImV4cGlyZXMiOjEzOTk5MDIwMjd9--0f044f885ee7996cb3b23bf878b2f0b8c94d82d2'
print git
iOrderSrc=response1=urllib2.urlopen(git).read()

data={}
data['condizionePagamento'] = 'GetCondizioniPagamentoPaginazione'
data['localita'] = 'GetListaCittaPaginazione'
data['report'] = 'GetListaReportsPersonalizzatiPaginazione'
data['valuta'] = 'GetListaValutePaginazione'
data['cliente'] = 'GetListaClientiGeneralePaginazione'
data['clienteBlocco'] = 'GetListaClientiBloccoPaginazione'
data['clienteContatto'] = 'GetListaClientiContattiPaginazione'
data['clienteAgente'] = 'GetListaClientiAgentiPaginazione'
data['clienteNota'] = 'GetListaClientiNotePaginazione'
data['clienteFatturato'] = 'GetListaClientiFatturatoPaginazione'
data['clienteDestinazione'] = 'GetListaClientiDestinazioniPaginazione'
data['clienteDocTest'] = 'GetListaClientiDocumentiTestatePaginazione'
data['clienteDocRiga'] = 'GetListaClientiDocumentiRighePaginazione'
data['clienteDocScad'] = 'GetListaClientiDocumentiScadenzePaginazione'
data['clienteGirovisita'] = 'GetListaClientiGiroVisitaPaginazione'
data['prodotto'] = 'GetListaProdottiPaginazione'
data['prodottoUltPrzAcq'] = 'GetListaProdottiUltimoAcquistoPaginazione'
data['prodottoUltPrzVend'] = 'GetListaProdottiUltimaVenditaPaginazione'
data['prodottoStorico'] = 'GetListaProdottiStoricoPaginazione'
data['prodottoGiacenza'] = 'GetListaProdottiGiagenzePaginazione'
data['prodottoUM'] = 'GetListaProdottiUMPaginazione'
data['prodottoListinoFull'] = 'GetListaProdottiListiniFullPaginazione'
data['prodottoScontoFull'] = 'GetListaProdottiScontiFullPaginazione'
#data['prodottoVarianteComb'] = 'GetListaVarCombinazioniPaginazione'
data['prodottoTaglieSviluppi'] = 'GetListaTaglieSviluppiPaginazione'
data['prodottoTaglieSviluppiArticolo'] = 'GetListaTaglieSviluppiArtPaginazione'
data['prodottoAssortimenti'] = 'GetListaAssortimentiPaginazione'
data['prodottoTaglieAssortimenti'] = 'GetListaTaglieAssortimentiPaginazione'
data['prodottoTaglieCataloghi'] = 'GetListaTaglieCataloghiPaginazione'
data['prodottoTaglieCataloghiArticolo'] = 'GetListaTaglieCataloghiArtPaginazione'
data['prodottoClientiAssortimenti'] = 'GetListaClientiAssortimentiPaginazione'
data['prodottoArticoliAssortimenti'] = 'GetListaArticoliAssortimentiPaginazione'
data['prodottoTaglieEstensioni'] = 'GetListaTaglieEstensioniPaginazione'
data['fornitore'] = 'GetListaFornitoriGeneralePaginazione'
data['fornitoreContatto'] = 'GetListaFornitoriContattiPaginazione'
data['fornitoreNota'] = 'GetListaFornitoriNotePaginazione'
data['fornitoreFatturato'] = 'GetListaFornitoriFatturatoPaginazione'
data['fornitoreDestinazione'] = 'GetListaFornitoriDestinazioniPaginazione'
data['fornitoreDocTest'] = 'GetListaFornitoriDocumentiTestatePaginazione'
data['fornitoreDocRiga'] = 'GetListaFornitoriDocumentiRighePaginazione'
data['fornitoreDocScad'] = 'GetListaFornitoriDocumentiScadenzePaginazione'
#data['tipoOrdine'] = 'GetTipiOrdine'
#data['tipoRigaOmaggio'] = 'GetTipiRigaOmaggio'
#data['tipoRigaOrdine'] = 'GetTipiRigaOrdine'
#data['tipoDettaglioRigaOrdine'] = 'GetTipiDettaglioRigaOrdine'
# clienteModificato
# clienteNotaModificata
# orderRowDetail
# orderRowExtMatCol
# orderRow
# orderHeaderExt
# orderHeader
# orderImport
data['showcaseItem'] = 'GetShowcasePaginazione'
data['offertaTest'] = 'GetListaLeadTestateOffertePaginazione'
data['offertaRiga'] = 'GetListaLeadRigheOffertePaginazione'
data['lead'] = 'GetListaLeadsPaginazione'
#data['leadNota'] = 'GetListaExportNoteLeadPaginazione'
data['leadContatto'] = 'GetListaLeadContattiPaginazione'
data['leadSconto'] = 'GetListaLeadScontiPaginazione'
data['leadCustom'] = 'GetListaLeadCustomfieldPaginazione'
data['campagna'] = 'GetListaLeadsCampagnePaginazione'
# leadTemp
# leadNotaModificata
data['reportItem'] = 'GetReportsPaginazione'

for key, value in data.iteritems():
    wsdata='http://test.apexnet.it/appmanager/api/v1/help/operations/' + value
    print key + ' - ' + wsdata
	
    dati_git=estrai_proprieta_github(key, iOrderSrc)
    wsSrc=urllib2.urlopen(wsdata).read()
    dati_ws=estrai_proprieta_ws(wsSrc)
    compare_list(dati_ws, dati_git)
    

# prodottoUM
# ...
