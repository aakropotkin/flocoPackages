{

  inputs.packument.url   = "https://registry.npmjs.org/nopt?rev=144-24a732c678b2e16f163ee4dd57953df4";
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
    ident = "nopt";
    ldir  = "info/unscoped/n/nopt";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
