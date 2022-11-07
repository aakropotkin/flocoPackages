{

  inputs.packument.url   = "https://registry.npmjs.org/language-subtag-registry?rev=38-25925533de23ca792a150b2452661fd4";
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
    ident = "language-subtag-registry";
    ldir  = "info/unscoped/l/language-subtag-registry";
    inherit packument fetchInfo;
  } // latest';

}
