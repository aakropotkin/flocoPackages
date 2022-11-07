{

  inputs.packument.url   = "https://registry.npmjs.org/copy-anything?rev=24-b9557afb8a44a09032cb257ea19d4013";
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
    ident = "copy-anything";
    ldir  = "info/unscoped/c/copy-anything";
    inherit packument fetchInfo;
  } // latest';

}
