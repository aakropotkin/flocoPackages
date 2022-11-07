{

  inputs.packument.url   = "https://registry.npmjs.org/is-unicode-supported?rev=5-77ebf79e7556a0b702a5a9ba6bab8ab5";
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
    ident = "is-unicode-supported";
    ldir  = "info/unscoped/i/is-unicode-supported";
    inherit packument fetchInfo;
  } // latest';

}
