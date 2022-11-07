{

  inputs.packument.url   = "https://registry.npmjs.org/pacote?rev=238-5bf01c8a3fd7d3859a05ae8b51396252";
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
    ident = "pacote";
    ldir  = "info/unscoped/p/pacote";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
