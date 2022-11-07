{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.clonedeep?rev=53-f036f75d7418666e3a501fc65a4b831c";
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
    ident = "lodash.clonedeep";
    ldir  = "info/unscoped/l/lodash.clonedeep";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
