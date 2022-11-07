{

  inputs.packument.url   = "https://registry.npmjs.org/require-dir?rev=127-ca8ee0eb5805771b7ed37a6a8e7ed0ea";
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
    ident = "require-dir";
    ldir  = "info/unscoped/r/require-dir";
    inherit packument fetchInfo;
  } // latest';

}
