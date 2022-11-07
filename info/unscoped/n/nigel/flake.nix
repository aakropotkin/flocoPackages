{

  inputs.packument.url   = "https://registry.npmjs.org/nigel?rev=49-902c81381b89733dfab6ae252a963878";
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
    ident = "nigel";
    ldir  = "info/unscoped/n/nigel";
    inherit packument fetchInfo;
  } // latest';

}
