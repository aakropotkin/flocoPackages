{

  inputs.packument.url   = "https://registry.npmjs.org/promise?rev=194-b478e97a949461ad97ad47a333116dd3";
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
    ident = "promise";
    ldir  = "info/unscoped/p/promise";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
