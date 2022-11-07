{

  inputs.packument.url   = "https://registry.npmjs.org/core-js-pure?rev=132-66fa371645f08dd514fc4e9efb3fbb54";
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
    ident = "core-js-pure";
    ldir  = "info/unscoped/c/core-js-pure";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
