{

  inputs.packument.url   = "https://registry.npmjs.org/emitter-listener?rev=11-4005e351691e8c53694432810d6e6ca7";
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
    ident = "emitter-listener";
    ldir  = "info/unscoped/e/emitter-listener";
    inherit packument fetchInfo;
  } // latest';

}
