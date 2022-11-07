{

  inputs.packument.url   = "https://registry.npmjs.org/xmlhttprequest?rev=50-92bafe8ba6031b10f627374d87047832";
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
    ident = "xmlhttprequest";
    ldir  = "info/unscoped/x/xmlhttprequest";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
