{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.merge?rev=72-134feca6aa1bb72c57b6a940f56a4860";
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
    ident = "lodash.merge";
    ldir  = "info/unscoped/l/lodash.merge";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
