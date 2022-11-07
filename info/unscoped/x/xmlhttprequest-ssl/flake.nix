{

  inputs.packument.url   = "https://registry.npmjs.org/xmlhttprequest-ssl?rev=16-2b5428d7bd3e6abc9cc9ad6be7ef397b";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "xmlhttprequest-ssl";
    ldir  = "info/unscoped/x/xmlhttprequest-ssl";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
