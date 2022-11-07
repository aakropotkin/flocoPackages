{

  inputs.packument.url   = "https://registry.npmjs.org/@swc/core-win32-ia32-msvc?rev=195-2e837d8ba40702cfa6a927be1da47a70";
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
    scope = "@swc";
    ident = "@swc/core-win32-ia32-msvc";
    ldir  = "info/swc/core-win32-ia32-msvc";
    inherit packument fetchInfo;
  } // latest';

}
