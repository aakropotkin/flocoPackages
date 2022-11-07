{

  inputs.packument.url   = "https://registry.npmjs.org/to-regex?rev=14-68c7a6bf82ad2503bad31d50085d07eb";
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
    ident = "to-regex";
    ldir  = "info/unscoped/t/to-regex";
    inherit packument fetchInfo;
  } // latest';

}
