{

  inputs.packument.url   = "https://registry.npmjs.org/vfile-message?rev=16-2cb7b5b51842bff525f6e4a9fbb318b8";
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
    ident = "vfile-message";
    ldir  = "info/unscoped/v/vfile-message";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
