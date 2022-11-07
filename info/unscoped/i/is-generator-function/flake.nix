{

  inputs.packument.url   = "https://registry.npmjs.org/is-generator-function?rev=32-5d17d1b382ae62f9b0983f68be54e371";
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
    ident = "is-generator-function";
    ldir  = "info/unscoped/i/is-generator-function";
    inherit packument fetchInfo;
  } // latest';

}
