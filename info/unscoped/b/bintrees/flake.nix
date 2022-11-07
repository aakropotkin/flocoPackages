{

  inputs.packument.url   = "https://registry.npmjs.org/bintrees?rev=44-cec1ef9c4d9c2abac74c4165580c860c";
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
    ident = "bintrees";
    ldir  = "info/unscoped/b/bintrees";
    inherit packument fetchInfo;
  } // latest';

}
