{

  inputs.packument.url   = "https://registry.npmjs.org/when?rev=186-36b3ae8a81c36d16c53b8cf0ce9644c6";
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
    ident = "when";
    ldir  = "info/unscoped/w/when";
    inherit packument fetchInfo;
  } // latest';

}
