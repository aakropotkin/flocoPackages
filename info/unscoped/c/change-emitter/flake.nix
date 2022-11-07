{

  inputs.packument.url   = "https://registry.npmjs.org/change-emitter?rev=11-2902b8af08c73bff9a1ca6410a074af1";
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
    ident = "change-emitter";
    ldir  = "info/unscoped/c/change-emitter";
    inherit packument fetchInfo;
  } // latest';

}
