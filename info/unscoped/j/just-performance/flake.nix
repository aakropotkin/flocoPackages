{

  inputs.packument.url   = "https://registry.npmjs.org/just-performance?rev=7-1ac1036b1a034c5b2ad76718f9496286";
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
    ident = "just-performance";
    ldir  = "info/unscoped/j/just-performance";
    inherit packument fetchInfo;
  } // latest';

}
