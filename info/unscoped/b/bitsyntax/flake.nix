{

  inputs.packument.url   = "https://registry.npmjs.org/bitsyntax?rev=14-9b7040e27d0ba04bef68ab897516578c";
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
    ident = "bitsyntax";
    ldir  = "info/unscoped/b/bitsyntax";
    inherit packument fetchInfo;
  } // latest';

}
